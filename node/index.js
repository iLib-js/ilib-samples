/*
 * index.js - ilib test file for nodejs
 *
 * Copyright © 2021 JEDLSoft
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

var path = require('path');

var basePath = "/home/goun/Source/opensource_iLib/master/js"

var ilib = require(path.join(basePath, ""));
var ResBundle = require(path.join(basePath, "lib/ResBundle"));
var defaultRcPath = path.join(process.cwd(), "resources");

console.log("#### iLib Test on nodejs ########");

console.log("1) Default Resbundle");
testResbundle();

//ilib.setPaths(path.join(process.cwd(),"resources2"));
var ilibLoader = ilib.getLoader();
ilibLoader.isMultiPaths(true);
ilibLoader.setPaths(path.join(process.cwd(), "resources2"));

console.log("2) Multiple paths for Resbundle");
testResbundle();

//ilib.clearPaths();

function testResbundle(){
    var rb = new ResBundle({
        locale:"ko-KR",
        basePath: defaultRcPath
    });
    var str = rb.getString("Hello").toString();
    console.log(str);
    var str = rb.getString("Thank you").toString();
    console.log(str);
}