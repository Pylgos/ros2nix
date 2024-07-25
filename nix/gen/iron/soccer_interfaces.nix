{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  soccer_vision_2d_msgs,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_interfaces = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "27b93f9488ef739e5b41257361fe85795cfaaa68";
        hash = "sha256-gqh70BqT43/j2+iQYWCzWSmMNXmChpvNweqb1+/iJMI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_interfaces";
  version = "0.3.0-1";
  src = sources.soccer_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ soccer_vision_2d_msgs soccer_vision_3d_msgs soccer_vision_attribute_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
