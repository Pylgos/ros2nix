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
        rev = "fbd4968594085b971567db7ba2b394dcabc635e4";
        hash = "sha256-PiPc5JP1OmVVsMQFHxj/YXtoYgw5Qrf8fU5SED9Rr14=";
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
  version = "8.0.2-1";
  src = sources.yaml_cpp_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyamlcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
