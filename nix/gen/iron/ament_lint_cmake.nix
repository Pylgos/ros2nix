{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_lint_cmake = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8c17138a59df47e42311868170a3a35a7921256b";
        hash = "sha256-kl2Gdk0Otr9qarOG9gxVSIjEq3N4Z8o51IyZYWtqAX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_cmake";
  version = "0.14.3-1";
  src = sources.ament_lint_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
