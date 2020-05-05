module WebpackBundleHelper
  def javascript_bundle_tag(entry, **options)
    path = public_bundle_path "#{entry}.js"

    options = {
      src: path,
      defer: true
    }.merge(options)

    javascript_include_tag('', **options)
  end

  def stylesheet_bundle_tag(entry, **options)
    path = public_bundle_path "#{entry}.css"

    options = {
      href: path
    }.merge(options)

    stylesheet_link_tag('', **options)
  end

  def public_bundle_path(entry)
    [ENV['HUGEMAN_FRONT_PROTOCOL'], "://", ENV['HUGEMAN_FRONT_HOST'], manifest.fetch(entry)].join
  end

  private

  MANIFEST_PATH = 'public/assets/manifest.json'.freeze

  def manifest
    @manifest ||= JSON.parse(File.read(MANIFEST_PATH))
  end
end
