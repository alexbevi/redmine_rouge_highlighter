# Redmine Rouge Syntax Highlighter

This plugin encapsulates the work done by [Go Maeda](https://twitter.com/g_maeda) on the [Redmine](http://www.redmine.org) issue tracker (see [Feature #24681](http://www.redmine.org/issues/24681)).

The [Rouge](https://github.com/jneen/rouge) syntax highlighter provides much more extensive language support than the default bundled with Redmine ([CodeRay](https://github.com/rubychan/coderay)).

## Installation

```bash
cd /path/to/redmine/plugins
git clone https://github.com/alexbevi/redmine_rouge_highlighter.git
cd ..
bundle install
```
No fuss, no muss, no migrations

## MIT License

Copyright (c) 2017 Alex Bevilacqua

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.