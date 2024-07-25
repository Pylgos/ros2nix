{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    control_box_rst = substituteSource {
      src = fetchgit {
        name = "control_box_rst-source";
        url = "https://github.com/ros2-gbp/control_box_rst-release.git";
        rev = "109cacd4e494bd81bba619b97f9c8775e7f855b2";
        hash = "sha256-lP1D5KTn9sR9fzHdtP14RffVJx5tHfYgoawB5j/xsFc=";
      };
      substitutions = [
        {
          path = "src/extern/protobuf/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/protobuf.git";
          to = "URL ${control_box_rst-vendor_source-protobuf-0}";
        }
        {
          path = "src/extern/yaml-cpp/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git";
          to = "URL ${control_box_rst-vendor_source-yaml-cpp-0}";
        }
      ];
    };
    control_box_rst-vendor_source-protobuf-0 = substituteSource {
      src = fetchgit {
        name = "control_box_rst-vendor_source-protobuf-0-source";
        url = "https://github.com/google/protobuf.git";
        rev = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2";
        hash = "sha256-xHCCXM7BtpIbWvJ6VbqNTIN+PomrprZY+YR5qn7l9lc=";
      };
      substitutions = [
      ];
    };
    control_box_rst-vendor_source-yaml-cpp-0 = substituteSource {
      src = fetchgit {
        name = "control_box_rst-vendor_source-yaml-cpp-0-source";
        url = "https://github.com/jbeder/yaml-cpp.git";
        rev = "ee99c4151c1af794a412b101a75921c086acaac0";
        hash = "sha256-D5brGCzg0v9SmCLcLx+NEOIXz//74ofQjA4kqw2LH4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "control_box_rst";
  version = "0.0.7-1";
  src = sources.control_box_rst;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
