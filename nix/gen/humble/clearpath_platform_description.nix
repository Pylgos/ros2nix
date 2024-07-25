{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    clearpath_platform_description = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "337eaf2f9aea2586f5768122757916b54a0767f4";
        hash = "sha256-WbjHtuNmA2moM+Cc2HTe7Gct+xPfTQZsycEAoHktISI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_platform_description";
  version = "0.2.9-1";
  src = sources.clearpath_platform_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
