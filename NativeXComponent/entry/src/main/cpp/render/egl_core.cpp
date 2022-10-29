/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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


char vertexShader[] =
"#version 300 es\n"
"layout(location = 0) in vec4 a_position;\n"
"layout(location = 1) in vec4 a_color;\n"
"out vec4 v_color;\n"
"void main()\n"
"{\n"
"   gl_Position = a_position;\n"
"   v_color = a_color;\n"
"}\n";


char fragmentShader[] =
"#version 300 es\n"
"precision mediump float;\n"
"in vec4 v_color;\n"
"out vec4 fragColor;\n"
"void main()\n"
"{\n"
"   fragColor = v_color;\n"
"}\n";


void EGLCore::eglContextInit(void* window, int w, int h)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "EGLCore", "eglContextInit ===> window = %{public}p, w = %{public}d, h = %{public}d", window, w, h);
    width_ = w;
    height_ = h;
    mEglWindow = static_cast<EGLNativeWindowType>(window);

    // init
    EGLint majorVersion;
    EGLint minorVersion;
    mEglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (mEglDisplay == EGL_NO_DISPLAY) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "eglGetDisplay ===> unable to get EGL display");
        return;
    }
    if (!eglInitialize(mEglDisplay, &majorVersion, &minorVersion)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "eglInitialize ===> unable to get initialize EGL display");
        return;
    }

    // choose config
    EGLint attribList[] = {
        EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
        EGL_RED_SIZE, 8,
        EGL_GREEN_SIZE, 8,
        EGL_BLUE_SIZE, 8,
        EGL_ALPHA_SIZE, 8,
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT,
        EGL_NONE
    };

    const EGLint maxConfigs = 1;
    EGLint numConfigs;
    if (!eglChooseConfig(mEglDisplay, attribList, &mEglConfig, maxConfigs, &numConfigs)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "eglChooseConfig ===> unable to choose configs");
        return;
    }

    // create surface
    EGLint winAttribs[] = {
        EGL_GL_COLORSPACE_KHR, EGL_GL_COLORSPACE_SRGB_KHR,
        EGL_NONE
    };
    if (mEglWindow) {
        mEglSurface = eglCreateWindowSurface(mEglDisplay, mEglConfig, mEglWindow, NULL);
        if (mEglSurface == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "eglCreateWindowSurface ===> unable to create surface");
            return;
        }
    }

    // create context
    EGLint verList[] = {
        EGL_CONTEXT_CLIENT_VERSION, 2,
        EGL_NONE
    };

    mEglContext = eglCreateContext(mEglDisplay, mEglConfig, EGL_NO_CONTEXT, verList);
    if (!eglMakeCurrent(mEglDisplay, mEglSurface, mEglSurface, mEglContext)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "eglMakeCurrent ===> error = %{public}d", eglGetError());
    }

    // create program
    mProgramHandle = createProgram(vertexShader, fragmentShader);
    if (!mProgramHandle) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "createProgram ===> unable to create program");
        return;
    }
}


void EGLCore::draw()
{
    GLfloat color[] = {
        0.5f, 0.6f, 0.3f, 1.0f
    };

    const GLfloat rectangleVertices[] = {
        -0.5f, 0.5f,
        0.5f, 0.5f,
        0.5f, -0.5f,
        -0.5f, -0.5f
    };

    glViewport(0, 0, width_, height_);
    glClearColor(0.0, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(mProgramHandle);
    GLint positionHandle = glGetAttribLocation(mProgramHandle, "a_position");
    glVertexAttribPointer(positionHandle, 2, GL_FLOAT, GL_FALSE, 0, rectangleVertices);
    glEnableVertexAttribArray(positionHandle);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
    glDisableVertexAttribArray(positionHandle);

    glFlush();
    glFinish();
    eglSwapBuffers(mEglDisplay, mEglSurface);
    flag = true;
}


void EGLCore::changeColor()
{
    if (!eglMakeCurrent(mEglDisplay, mEglSurface, mEglSurface, mEglContext)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "elgMakeCurrent ===> error = %{public}d", eglGetError());
    }

    GLfloat color[] = {
        0.9f, 0.5f, 0.7f, 1.0f
    };

    const GLfloat rectangleVertices[] = {
        -0.5f, 0.5f,
        0.5f, 0.5f,
        0.5f, -0.5f,
        -0.5f, -0.5f
    };

    glViewport(0, 0, width_, height_);
    glClearColor(0.0, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(mProgramHandle);
    GLint positionHandle = glGetAttribLocation(mProgramHandle, "a_position");
    glVertexAttribPointer(positionHandle, 2, GL_FLOAT, GL_FALSE, 0, rectangleVertices);
    glEnableVertexAttribArray(positionHandle);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
    glDisableVertexAttribArray(positionHandle);

    if (flag) {
        eglSwapBuffers(mEglDisplay, mEglSurface);
    }
}


GLuint EGLCore::loadShader(GLenum type, const char *shaderSrc)
{
    GLuint shader;
    GLint compiled;

    shader = glCreateShader(type);
    if (shader == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "glCreateShader ===> unable to load shader");
        return 0;
    }

    glShaderSource(shader, 1, &shaderSrc, nullptr);
    glCompileShader(shader);

    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (!compiled) {
        GLint infoLen = 0;
        glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infoLen);
        if (infoLen > 1) {
            char *infoLog = (char*)malloc(sizeof(char) * infoLen);
            glGetShaderInfoLog(shader, infoLen, nullptr, infoLog);
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "glCompileShader ===> error = \n%s\n", infoLog);
            free(infoLog);
        }
        glDeleteShader(shader);
        return 0;
    }
    return shader;
}


GLuint EGLCore::createProgram(const char * vertexShader, const char * fragShader)
{
    GLuint vertex;
    GLuint fragment;
    GLuint program;
    GLint linked;

    vertex = loadShader(GL_VERTEX_SHADER, vertexShader);
    if (vertex == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "createProgram ===> vertex error");
        return 0;
    }

    fragment = loadShader(GL_FRAGMENT_SHADER, fragShader);
    if (fragment == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "createProgram ===> fragment error");
        glDeleteShader(vertex);
        return 0;
    }

    program = glCreateProgram();
    if (program == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "createProgram ===> program error");
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        return 0;
    }

    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);

    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (!linked) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "createProgram ===> linked error");
        GLint infoLen = 0;
        glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLen);
        if (infoLen > 1) {
            char *infoLog = (char *)malloc(sizeof(char) * infoLen);
            glGetProgramInfoLog(program, infoLen, nullptr, infoLog);
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "EGLCore", "glLinkProgram ===> error = \n%s\n", infoLog);
            free(infoLog);
        }
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        glDeleteProgram(program);
        return 0;
    }
    glDeleteShader(vertex);
    glDeleteShader(fragment);
    return program;
}