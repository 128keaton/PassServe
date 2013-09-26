PassServe
=========

Two files that will make your life much easier. 

Requirements:
------------
AFNetworking - https://github.com/AFNetworking/AFNetworking  
CocoaPods - https://raw.github.com/128keaton/Lucardio/ios6/Podfile  
Podfile - https://raw.github.com/128keaton/Lucardio/ios6/Podfile (Only use this if you do not know how to make a Podfile.)  
Compatibility
------------
Tested on iOS 7, might work on iOS 6

Installation
-----------
1. Follow the instructions to install CocoaPods and AFNetworking on their pages. Do not bother me about this.  
2. Unzip the archive and drag the files in the archive into your Xcode project.
3. Add:    
```#import "PassServe.h"```     
into the file which you will download passes with.

Usage
-----
To generate a pass on a remote server, use:

    [PassServe generatePassWithURL:@"http://pass.keatonburleson.com/" argument:@"example.php?name=joejoeboom" activityView:spinny webView:webView];

To download a pass from a remote server use:
     
    [PassServe downloadPassWithURL:[NSURL URLWithString:@"http://pass.keatonburleson.com/SavedPasses/pass.pkpass"] passName:@"joejoeboom.pkpass" webView:webView tableView:self.tableView overwrite:true];
     
Demo
----
https://github.com/128keaton/Lucardio. To use this, you need cocoapods in the directory and have AFNetworking installed.

Future Plans
------------

- ~~Download pass from remote source~~
- ~~Generate pass from remote source~~
-    Full logging mode
