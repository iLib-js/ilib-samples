# Ilib-lint Sample

A sample to demonstrate how to call and use the ilib-lint tool to find
i18n problems in your code.

For now, the lint tool can only check for problems in xliff files. As it
matures, it will be able to check for problems in source files of various
types based on plugins.

# Usage

To run the sample, first run `npm install` to install the lint tool
and the python plugins for it.

Then simply call:

```
$ npm run lint
```

This will run the lint tool on the current project and report back a
number of problems that have been purposely put there to demonstrate
each type of problem.

The file src/prime.py is the source code for this sample. You can use
the django extraction tool to create a .po file out of the strings
which can subsequently be localized with the loctool.

The directory `xliffs` contains translations of those strings with
the problems built into them. The strings in there demonstrate not
only the problems with python strings, but also with resources in
general. For example, they contain problems with python placeholder
syntax, as well as general problems such as placeholders that exist
in the source strings but not the target string.

The `ilib-lint-config.json` file configures the lint tool to be able
to load the plugins it needs and to understand what to check and which
rules to apply. Take a look at it to better understand a working
example of this file.

## License

Copyright © 2023, JEDLSoft

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.

## Release Notes

### v1.1.0

- added more sample problems in the xliff files
- updated dependencies

### v1.0.0

- Initial version
