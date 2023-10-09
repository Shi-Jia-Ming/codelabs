import { AppendixFile, FileType } from '../common/bean/AppendixBean';

export const imageIndex: Array<AppendixFile> = [
  { index: FileType.TXT, fileType: 'txt', icon: $r('app.media.ic_files_grid_txt') },
  { index: FileType.DOC, fileType: 'doc', icon: $r('app.media.ic_files_documents') },
  { index: FileType.PDF, fileType: 'pdf', icon: $r('app.media.ic_files_pdf') }
];