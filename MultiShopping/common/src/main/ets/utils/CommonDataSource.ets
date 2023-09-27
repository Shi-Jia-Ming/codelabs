/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
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

export class CommonDataSource<T> implements IDataSource {
	private dataArray: T[] = [];
	private listeners: DataChangeListener[] = [];

	constructor(element: T[]) {
		this.dataArray = element;
	}

	public getData(index: number) {
		return this.dataArray[index]
	}

	public totalCount(): number {
		return this.dataArray.length;
	}

	public addData(index: number, data: T[]): void {
		this.dataArray = this.dataArray.concat(data);
		this.notifyDataAdd(index);
	}

	public pushData(data: T): void {
		this.dataArray.push(data);
		this.notifyDataAdd(this.dataArray.length - 1);
	}

	unregisterDataChangeListener(listener: DataChangeListener): void {
		const pos = this.listeners.indexOf(listener);
		if (pos >= 0) {
			this.listeners.splice(pos, 1);
		}
	}

	registerDataChangeListener(listener: DataChangeListener): void {
		if (this.listeners.indexOf(listener) < 0) {
			this.listeners.push(listener);
		}
	}

	notifyDataReload(): void {
		this.listeners.forEach((listener: DataChangeListener) => {
			listener.onDataReloaded();
		})
	}

	notifyDataAdd(index: number): void {
		this.listeners.forEach((listener: DataChangeListener) => {
			listener.onDataAdd(index);
		})
	}

	notifyDataChange(index: number): void {
		this.listeners.forEach((listener: DataChangeListener) => {
			listener.onDataChange(index);
		})
	}

	notifyDataDelete(index: number): void {
		this.listeners.forEach((listener: DataChangeListener) => {
			listener.onDataDelete(index);
		})
	}

	notifyDataMove(from: number, to: number): void {
		this.listeners.forEach((listener: DataChangeListener) => {
			listener.onDataMove(from, to);
		})
	}
}