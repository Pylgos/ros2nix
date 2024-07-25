{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    tinyxml2_vendor = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "65bf42d930eef0ab311421d396e871b95976540e";
        hash = "sha256-gkmDDYJJAdZJUNlSQKd+X81Vds9unVTFu5xzCE7jyhc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml2_vendor";
  version = "0.8.3-1";
  src = sources.tinyxml2_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
