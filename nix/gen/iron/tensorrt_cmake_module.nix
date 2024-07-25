{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tensorrt_cmake_module = substituteSource {
      src = fetchgit {
        name = "tensorrt_cmake_module-source";
        url = "https://github.com/ros2-gbp/tensorrt_cmake_module-release.git";
        rev = "2514207ab44db5e7a7d2221839c84b01e6a7d677";
        hash = "sha256-S620gK89qsxhq1mo2yFSZCD1LP45mJBLXJbCTiT5VZk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tensorrt_cmake_module";
  version = "0.0.3-3";
  src = sources.tensorrt_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
