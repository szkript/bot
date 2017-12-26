classdef history
   properties
      Games
   end
   methods
      function r = addGame(obj,game)
         obj.Games{length(games)+1}=game;
         r=obj;
      end
      function r = multiplyBy(obj,n)
         r = [obj.Value] * n;
      end
      function a=getCurrentGame(obj)
        a=obj.Games{length(games)};
      end
   end
end
