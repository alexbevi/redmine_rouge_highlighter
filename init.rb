require_dependency "hooks"
require_dependency "patches"

Redmine::Plugin.register :redmine_rouge_highlighter do
  name        "Redmine Rouge-based Syntax Highlighter"
  author      "Alex Bevilacqua"
  description "Supplement CodeRay with Rouge"
  url         "https://github.com/alexbevi/redmine_rouge_highlighter"
  author_url  "mailto:alexbevi@gmail.com"
  version     "0.0.1"

  requires_redmine :version_or_higher => '3.0.0'
end

Redmine::SyntaxHighlighting.highlighter = 'CodeRayWithFallback'