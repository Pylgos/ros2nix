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
        rev = "d516096763524853e8317020610ec07aac7b0da4";
        hash = "sha256-HEG9kwIr6mxkYCMU0hJzDgZZOsx5NgqjKf0y6BkwcbA=";
      };
      substitutions = [
        {
          path = "src/extern/grpc/CMakeLists.txt";
          from = "GIT_REPOSITORY \${GRPC_URL}";
          to = "URL ${control_box_rst-vendor_source0}";
        }
        {
          path = "src/extern/protobuf/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/protobuf.git";
          to = "URL ${control_box_rst-vendor_source0}";
        }
        {
          path = "src/extern/yaml-cpp/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git";
          to = "URL ${control_box_rst-vendor_source0}";
        }
      ];
    };
    control_box_rst-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "control_box_rst-vendor_source0-source";
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
