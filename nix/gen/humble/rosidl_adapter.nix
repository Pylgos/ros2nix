{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  python3Packages,
  rosidl_cli,
  substituteSource,
}:
let
  sources = rec {
    rosidl_adapter = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "ec31813f1ee7890a182342cb48b53bc789e99182";
        hash = "sha256-e+RQuMTQ10LvQzPfeGxjvb8uKiQimloj31bNOGYhNcY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "3.1.5-2";
  src = sources.rosidl_adapter;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_core python3 buildPackages.python3Packages.empy rosidl_cli ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_core python3Packages.empy rosidl_cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
