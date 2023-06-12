/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdio.h>

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl3.h>
#include <hilog/log.h>

#include "egl_core.h"
#include "plugin_render.h"
#include "../common/common.h"

void EGLCore::EglContextInit(void *window, int width, int height)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EGLCore",
        "EglContextInit ===> window = %{public}p, w = %{public}d, h = %{public}d", window, width, height);
    m_width = width;
    m_height = height;
    if (m_width > 0) {
        m_widthPercent = FIFTY_PERCENT * m_height / m_width;
    }
    m_eglWindow = static_cast<EGLNativeWindowType>(window);

    // Init display.
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (EGL_NO_DISPLAY == m_eglDisplay) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglGetDisplay ===> unable to get EGL display");
        return;
    }

    EGLint majorVersion;
    EGLint minorVersion;
    if (!eglInitialize(m_eglDisplay, &majorVersion, &minorVersion)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore",
            "eglInitialize ===> unable to get initialize EGL display");
        return;
    }

    // Select configuration.
    const EGLint maxConfigSize = 1;
    EGLint numConfigs;
    if (!eglChooseConfig(m_eglDisplay, ATTRIB_LIST, &m_eglConfig, maxConfigSize, &numConfigs)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglChooseConfig ===> unable to choose configs");
        return;
    }

    // Create surface.
    if (nullptr != m_eglWindow) {
        m_eglSurface = eglCreateWindowSurface(m_eglDisplay, m_eglConfig, m_eglWindow, NULL);
        if (m_eglSurface == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore",
                "eglCreateWindowSurface ===> unable to create surface");
            return;
        }
    }

    // Create context.
    m_eglContext = eglCreateContext(m_eglDisplay, m_eglConfig, EGL_NO_CONTEXT, CONTEXT_ATTRIBS);
    if (!eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglContext)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglMakeCurrent ===> error = %{public}d",
            eglGetError());
        return;
    }

    // Create program.
    m_programHandle = CreateProgram(VERTEX_SHADER, FRAGMENT_SHADER);
    if (!m_programHandle) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "CreateProgram ===> unable to create program");
        return;
    }
}

void EGLCore::Background()
{
    GLint positionHandle = PrepareDraw();
    if (-1 == positionHandle) {
        return;
    }
    ExecuteDraw(positionHandle, BACKGROUND_COLOR, BACKGROUND_RECTANGLE_VERTICES);
    FinishDraw();
}

void EGLCore::Draw()
{
    GLint positionHandle = PrepareDraw();
    if (-1 == positionHandle) {
        return;
    }
    ExecuteDraw(positionHandle, BACKGROUND_COLOR, BACKGROUND_RECTANGLE_VERTICES);

    const GLfloat rectangleVertices[] = {
        -m_widthPercent, FIFTY_PERCENT,
        m_widthPercent, FIFTY_PERCENT,
        m_widthPercent, -FIFTY_PERCENT,
        -m_widthPercent, -FIFTY_PERCENT
    };
    ExecuteDraw(positionHandle, DRAW_COLOR, rectangleVertices);

    FinishDraw();
    m_flag = true;
}

void EGLCore::ChangeColor()
{
    if (!m_flag) {
        return;
    }
    GLint positionHandle = PrepareDraw();
    if (-1 == positionHandle) {
        return;
    }
    ExecuteDraw(positionHandle, BACKGROUND_COLOR, BACKGROUND_RECTANGLE_VERTICES);

    const GLfloat rectangleVertices[] = {
        -m_widthPercent, FIFTY_PERCENT,
        m_widthPercent, FIFTY_PERCENT,
        m_widthPercent, -FIFTY_PERCENT,
        -m_widthPercent, -FIFTY_PERCENT
    };
    ExecuteDraw(positionHandle, CHANGE_COLOR, rectangleVertices);

    FinishDraw();
}

GLint EGLCore::PrepareDraw()
{
    if (!eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglContext)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "elgMakeCurrent ===> error = %{public}d",
            eglGetError());
        return -1;
    }

    glViewport(DEFAULT_X_POSITION, DEFAULT_X_POSITION, m_width, m_height);
    glClearColor(GL_RED_DEFAULT, GL_GREEN_DEFAULT, GL_BLUE_DEFAULT, GL_ALPHA_DEFAULT);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(m_programHandle);

    GLint positionHandle = glGetAttribLocation(m_programHandle, "a_position");
    return positionHandle;
}

void EGLCore::ExecuteDraw(GLint positionHandle, const GLfloat *color, const GLfloat rectangleVertices[])
{
    glVertexAttribPointer(positionHandle, POINTER_SIZE, GL_FLOAT, GL_FALSE, 0, rectangleVertices);
    glEnableVertexAttribArray(positionHandle);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, TRIANGLE_FAN_SIZE);
    glDisableVertexAttribArray(positionHandle);
}

void EGLCore::FinishDraw()
{
    glFlush();
    glFinish();
    eglSwapBuffers(m_eglDisplay, m_eglSurface);
}

GLuint EGLCore::LoadShader(GLenum type, const char *shaderSrc)
{
    GLuint shader;
    GLint compiled;

    shader = glCreateShader(type);
    if (0 == shader) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glCreateShader ===> unable to load shader");
        return 0;
    }

    glShaderSource(shader, 1, &shaderSrc, nullptr);
    glCompileShader(shader);

    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (!compiled) {
        GLint infoLen = 0;
        glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infoLen);
        if (infoLen > 1) {
            char *infoLog = (char *)malloc(sizeof(char) * infoLen);
            glGetShaderInfoLog(shader, infoLen, nullptr, infoLog);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glCompileShader ===> error = \n%s\n",
                infoLog);
            free(infoLog);
        }
        glDeleteShader(shader);
        return 0;
    }
    return shader;
}

GLuint EGLCore::CreateProgram(const char *vertexShader, const char *fragShader)
{
    GLuint vertex;
    vertex = LoadShader(GL_VERTEX_SHADER, vertexShader);
    if (0 == vertex) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram ===> vertex error");
        return PROGRAM_ERROR;
    }

    GLuint fragment;
    fragment = LoadShader(GL_FRAGMENT_SHADER, fragShader);
    if (0 == fragment) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram ===> fragment error");
        glDeleteShader(vertex);
        return PROGRAM_ERROR;
    }

    GLuint program;
    program = glCreateProgram();
    if (0 == program) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram ===> program error");
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        return PROGRAM_ERROR;
    }

    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);

    GLint linked;
    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (!linked) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram ===> linked error");
        GLint infoLen = 0;
        glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLen);
        if (infoLen > 1) {
            char *infoLog = (char *)malloc(sizeof(char) * infoLen);
            glGetProgramInfoLog(program, infoLen, nullptr, infoLog);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glLinkProgram ===> error = \n%s\n", infoLog);
            free(infoLog);
        }
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        glDeleteProgram(program);
        return PROGRAM_ERROR;
    }
    glDeleteShader(vertex);
    glDeleteShader(fragment);
    return program;
}

void EGLCore::Release()
{
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglDestroyContext(m_eglDisplay, m_eglContext);
    eglTerminate(m_eglDisplay);
}