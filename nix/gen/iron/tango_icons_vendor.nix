{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tango-icon-theme,
}:
let
  sources = rec {
    tango_icons_vendor = substituteSource {
      src = fetchgit {
        name = "tango_icons_vendor-source";
        url = "https://github.com/ros2-gbp/tango_icons_vendor-release.git";
        rev = "012ef5e1a8dc3330f34f8209ff7cddc3a8b33977";
        hash = "sha256-X895aiMZYZy/XuDzhmwhSeuQ7uCIKWf0LKqYZaO1S8k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tango_icons_vendor";
  version = "0.2.2-3";
  src = sources.tango_icons_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tango-icon-theme ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
