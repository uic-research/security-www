if Jekyll::env == 'deploy'
  require 'squoosh'

  Jekyll::Hooks.register [:documents, :pages], :post_render, priority: :high do |doc|
    case File.extname(doc.destination('./'))
    when '.html', '.htm'
      doc.output = Squoosh::minify_html doc.output
    when '.js'
      doc.output = Squoosh::minify_js doc.output
    end
  end
end

# vim: set sw=2 sts=2 ts=8 expandtab:
