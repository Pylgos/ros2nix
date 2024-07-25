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
    shared_queues_vendor = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "98650b0c7bd1f4fc704c296fa33482c4d142cf34";
        hash = "sha256-ioqHlatGSOPTbKZ0R/R1jjxt47X5pi2UrKkl5cSsFP0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0}";
        }
      ];
    };
    shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0 = substituteSource {
      src = fetchzip {
        name = "shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shared_queues_vendor";
  version = "0.28.0-1";
  src = sources.shared_queues_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}