{
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lttng-tools,
  lttng-ust,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "205bfd617e249f1c3ba2bd145a7f34c652e9ccd2";
        hash = "sha256-ZD9KMKxTs31H4UCBDAFj81/ww7J3YUjz36CrbRGw4Bg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "8.3.0-1";
  src = sources.tracetools;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-tools lttng-ust ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}