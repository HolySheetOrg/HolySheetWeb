import 'dart:async';
import 'dart:html';

import 'package:HolySheetWeb/src/fetched_file.dart';
import 'package:HolySheetWeb/src/file_service.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'file-list',
  styleUrls: ['file_list_component.css'],
  templateUrl: 'file_list_component.html',
  directives: [
    NgFor,
    NgIf,
  ],
)
class FileListComponent implements OnInit {
  final FileService fileService;

  List<FetchedFile> files = [];

  FileListComponent(this.fileService);

  @override
  Future<Null> ngOnInit() async {
    files = await fileService.fetchFiles();
  }

  void clickFile(FetchedFile file) {
    var selected = fileService.selected;
    if (selected.contains(file)) {
      selected.remove(file);
    } else {
      selected.add(file);
    }
  }

  bool isSelected(FetchedFile file) => fileService.selected.contains(file);
}
