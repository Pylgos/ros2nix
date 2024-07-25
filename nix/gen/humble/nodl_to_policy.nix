{
  ament_copyright,
  ament_flake8,
  ament_lint_auto,
  ament_mypy,
  ament_pep257,
  ament_pycodestyle,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nodl_python,
  python3Packages,
  ros2cli,
  ros2nodl,
  ros2run,
  ros_testing,
  sros2,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    nodl_to_policy = substituteSource {
      src = fetchgit {
        name = "nodl_to_policy-source";
        url = "https://github.com/ros2-gbp/nodl_to_policy-release.git";
        rev = "eeda7602efdc54fad5f60579ec503aeb34472d8e";
        hash = "sha256-e3+aKkyGXpBFCwulLKU8Tv8PSYEtqUTsp6iL1bE5W9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nodl_to_policy";
  version = "1.0.0-3";
  src = sources.nodl_to_policy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nodl_python python3Packages.lxml ros2cli ros2nodl ros2run sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
