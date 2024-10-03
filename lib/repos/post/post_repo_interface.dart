// Project: 	   concierge_admin
// File:    	   post_repo_interface
// Path:    	   lib/repos/post/post_repo_interface.dart
// Author:       Ali Akbar
// Date:        02-10-24 1:24:29 -- Wednesday
// Description:

import '../../models/post_model.dart';

abstract class PostRepoInterface {
  Future<void> fetch();
}
