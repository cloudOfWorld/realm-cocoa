Pod::Spec.new do |s|
  s.name                    = 'Realm'
  s.module_map              = 'Realm/module.modulemap'
  s.version                 = `sh build.sh get-version`
  s.summary                 = 'Realm is a modern data framework & database for iOS & OS X.'
  s.description             = <<-DESC
                              The Realm database, for Objective-C.

                              Realm is a mobile database: a replacement for Core Data & SQLite. You can use it on iOS & OS X. Realm is not an ORM on top SQLite: instead it uses its own persistence engine, built for simplicity (& speed). Learn more and get help at https://realm.io
                              DESC
  s.homepage                = "https://realm.io"
  s.source                  = { :git => 'https://github.com/realm/realm-cocoa.git', :tag => "v#{s.version}" }
  s.author                  = { 'Realm' => 'help@realm.io' }
  s.library                 = 'c++'
  s.requires_arc            = true
  s.social_media_url        = 'https://twitter.com/realm'
  s.documentation_url       = "https://realm.io/docs/objc/#{s.version}"
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }

  public_header_files       = 'include/Realm/RLMArray.h',
                              'include/Realm/RLMCollection.h',
                              'include/Realm/RLMConstants.h',
                              'include/Realm/RLMListBase.h',
                              'include/Realm/RLMMigration.h',
                              'include/Realm/RLMObject.h',
                              'include/Realm/RLMObjectBase.h',
                              'include/Realm/RLMObjectSchema.h',
                              'include/Realm/RLMPlatform.h',
                              'include/Realm/RLMProperty.h',
                              'include/Realm/RLMRealm.h',
                              'include/Realm/RLMResults.h',
                              'include/Realm/RLMSchema.h',
                              'include/Realm/Realm.h'

  s.compiler_flags          = "-DREALM_HAVE_CONFIG -DREALM_COCOA_VERSION='@\"#{s.version}\"'"
  s.prepare_command         = 'sh build.sh cocoapods-setup'
  s.source_files            = 'Realm/*.{m,mm}'
  s.header_mappings_dir     = 'include'
  s.xcconfig                = { 'CLANG_CXX_LANGUAGE_STANDARD' => 'compiler-default',
                                'OTHER_CPLUSPLUSFLAGS' => '-std=c++1y $(inherited)' }
  s.preserve_paths          = %w(build.sh)

  s.ios.deployment_target   = '7.0'
  s.ios.vendored_library    = 'core/librealm-ios.a'

  s.osx.deployment_target   = '10.9'
  s.osx.vendored_library    = 'core/librealm.a'

  s.subspec 'Headers' do |s|
    s.source_files          = 'include/**/*.{h,hpp}'
    s.public_header_files   = public_header_files
    s.private_header_files  = 'include/Realm/*{ListBase,ObjectStore,Private,Dynamic}.h'
  end
end
