{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    omni_base_laser_sensors = substituteSource {
      src = fetchgit {
        name = "omni_base_laser_sensors-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "0c59cad31d83d682cf31237798ed65d51500cd63";
        hash = "sha256-JnN2VcQfM5Z8lx+UHgALGnSzhVHvPjfVPfFHokpQoAE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_laser_sensors";
  version = "2.0.7-1";
  src = sources.omni_base_laser_sensors;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
