{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ouxt_lint_common,
  substituteSource,
}:
let
  sources = rec {
    ouxt_common = substituteSource {
      src = fetchgit {
        name = "ouxt_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "105c1732023b5138c09b8e1c60bfe32c557adb0e";
        hash = "sha256-4nyGy7HVcpb5Cb/zBa9+kz8o7aXZyGqY2Fdy17Xd9ZY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouxt_common";
  version = "0.0.8-4";
  src = sources.ouxt_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ouxt_lint_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
