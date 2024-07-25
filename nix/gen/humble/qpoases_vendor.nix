{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  subversion,
}:
let
  sources = rec {
    qpoases_vendor = substituteSource {
      src = fetchgit {
        name = "qpoases_vendor-source";
        url = "https://github.com/ros2-gbp/qpoases_vendor-release.git";
        rev = "b34b81f73e8dddb75471a44b1dfb5e24326d693c";
        hash = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qpoases_vendor";
  version = "3.2.3-3";
  src = sources.qpoases_vendor;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ subversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
