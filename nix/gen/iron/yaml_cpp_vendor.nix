{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  substituteSource,
}:
let
  sources = rec {
    yaml_cpp_vendor = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/yaml_cpp_vendor-release.git";
        rev = "1299c80cd7e90b0ff5d26cbc10b238fb459758ec";
        hash = "sha256-G0ji6hfYmaGefd0wX9r10sSmpbyiL5rTTS34HiVxztY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz";
          to = "URL ${yaml_cpp_vendor-vendor_source-yaml-cpp-0-0}";
        }
      ];
    };
    yaml_cpp_vendor-vendor_source-yaml-cpp-0-0 = substituteSource {
      src = fetchzip {
        name = "yaml_cpp_vendor-vendor_source-yaml-cpp-0-0-source";
        url = "https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz";
        hash = "sha256-2tFWccifn0c2lU/U1WNg2FHrBohjx8CXMllPJCevaNk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "yaml_cpp_vendor";
  version = "8.1.2-3";
  src = sources.yaml_cpp_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyamlcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
