# Local Resource

[![Gem Version](https://badge.fury.io/rb/local_resource.svg)](https://badge.fury.io/rb/local_resource)
[![CircleCI](https://circleci.com/gh/platanus/local_resource.svg?style=shield)](https://app.circleci.com/pipelines/github/platanus/local_resource)
[![Coverage Status](https://coveralls.io/repos/github/platanus/local_resource/badge.svg?branch=master)](https://coveralls.io/github/platanus/local_resource?branch=master)

Rails engine to treat external resources as if they were local.

## Installation

Add to your Gemfile:

```ruby
gem "local_resource"
```

```bash
bundle install
```

## Usage

### Using `Instance`

```ruby
instance = LocalResource::Instance.new("http://lorempixel.com/400/200", "my-photo.jpeg")
instance.file # it downloads the photo from lorempixel.com to the tmp file.
instance.file_path # it shows the local path of your downloaded image.
instance.destroy # it removes the photo from the /tmp directory.
```

### Using `as_local_resource`

```ruby
LocalResource.as_local_resource("http://lorempixel.com/400/200", "my-photo.jpeg") do |tmp_file_path|
  # some code needing the local file.
end
```

The previous code...

- It downloads the photo from lorempixel.com to the tmp file.
- It executes custom code that needs the local file.
- It removes the tmp file from tmp.

## Testing

To run the specs you need to execute, **in the root path of the gem**, the following command:

```bash
bundle exec guard
```

You need to put **all your tests** in the `/local_resource/spec/dummy/spec/` directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Thank you [contributors](https://github.com/platanus/local_resource/graphs/contributors)!

<img src="http://platan.us/gravatar_with_text.png" alt="Platanus" width="250"/>

Local Resource is maintained by [platanus](http://platan.us).

## License

Local Resource is © 2018 platanus, spa. It is free software and may be redistributed under the terms specified in the LICENSE file.
