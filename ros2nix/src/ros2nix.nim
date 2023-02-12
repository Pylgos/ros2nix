import cligen
import generator, ci

when isMainModule:
  dispatchMulti([generate], [ci.ci])
