{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_base = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_base-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_base-release.git";
        rev = "1ab4169f71f6ad75a790b1c8ec712bea04d694d6";
        hash = "sha256-EMtEy8XLykxcLHYCPgk6Ralivtfddx0U4aPIsdnxSlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_base";
  version = "1.0.1-3";
  src = sources.sick_safevisionary_base;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}