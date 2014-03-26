require "pygments"
require "redcarpet"

http_path = "/"
sass_dir = "./"
css_dir = "../assets/css"
images_dir = "../assets/img"
javascripts_dir = "../assets/js"
relative_assets = true
preferred_syntax = :sass

Slim::Engine.set_default_options :pretty => true, :sort_attrs => false

class SyntaxHighlighting < Redcarpet::Render::HTML
  def block_code(code, language)
    language = 'ruby' if language.to_s.strip.empty?
    Pygments.highlight(code, :lexer => language)
  end
end


Slim::Embedded.set_default_options(
  :markdown => {
    :renderer            => SyntaxHighlighting,
    :no_intra_emphasis   => true,
    :tables              => true,
    :gh_blockcode        => true,
    :fenced_code_blocks  => true,
    :autolink            => true,
    :strikethrough       => true,
    :lax_html_blocks     => true,
    :space_after_headers => true,
    :superscript         => true
  }
)

