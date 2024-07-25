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
        rev = "ff26edda096a9917a66fb5eb1e02f49844724ab2";
        hash = "sha256-phCcVqL1mvEu6tnlA+Uh48RdACsmUfW6qEz+JOlQ/2s=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip";
          to = "URL ${shared_queues_vendor-vendor_source-8f65a8734d77c3cc00d74c0532efca872931d3ce-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0}";
        }
      ];
    };
    shared_queues_vendor-vendor_source-8f65a8734d77c3cc00d74c0532efca872931d3ce-1 = substituteSource {
      src = fetchzip {
        name = "shared_queues_vendor-vendor_source-8f65a8734d77c3cc00d74c0532efca872931d3ce-1-source";
        url = "https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip";
        hash = "sha256-gX96jJteYLd/t2jvffx5lcpFETmGnBt6IW31dGBvR8c=";
      };
      substitutions = [
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
  version = "0.15.11-1";
  src = sources.shared_queues_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
