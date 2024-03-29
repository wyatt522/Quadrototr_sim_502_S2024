classdef SAC < handle
    properties(Access = public)
        altitude(1,1) double;
        k(1,2) double;
        u0(1,1) double;
    end


    methods(Access = public)
        function obj = SAC(gains, quadrotor)
            obj.u0 = quadrotor.m*quadrotor.g/4;
            obj.k = gains;
        end

        function u = output(self, ~, z, y)
            u = self.u0 + repmat(self.k*[(y(3) - z(3)); -z(9)],[4,1]);
        end
    end


end