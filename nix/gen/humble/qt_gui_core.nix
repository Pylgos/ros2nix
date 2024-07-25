{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    qt_gui_core = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "c28f98860efa144a8bc187ad4aa33d20c7650e3f";
        hash = "sha256-QjPjLv6CohwB5jtlGR6lKDYXNx7PcT8SqkhffcnNcqc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_core";
  version = "2.2.3-2";
  src = sources.qt_gui_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
