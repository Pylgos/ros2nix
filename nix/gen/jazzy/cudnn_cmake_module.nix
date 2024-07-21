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
    cudnn_cmake_module = substituteSource {
      src = fetchgit {
        name = "cudnn_cmake_module-source";
        url = "https://github.com/ros2-gbp/cudnn_cmake_module-release.git";
        rev = "de4d4f9f0b0abe550eb0594bb9cea11ceeb536e7";
        hash = "sha256-J6BqQzZzZMC0MVQ5oJCXgXu5fzoPlV+JErISeIuss6I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n    https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
          to = "DOWNLOAD file://${cudnn_cmake_module-vendor_source-FindCUDNN-0}";
        }
      ];
    };
    cudnn_cmake_module-vendor_source-FindCUDNN-0 = substituteSource {
      src = fetchurl {
        name = "cudnn_cmake_module-vendor_source-FindCUDNN-0-source";
        url = "https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
        hash = "sha256-pvm3+OkJ6qjN3Av6hrgKjmj3O52wFUsl/8eb9e7VL2Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cudnn_cmake_module";
  version = "0.0.1-6";
  src = sources.cudnn_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}