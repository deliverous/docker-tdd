
module DockerTdd
    module ContainerPlugin
        def before_setup
            super
            containers if respond_to? :containers
            instance_variables.map {|name| instance_variable_get name }.each do |value|
                value.start if value.respond_to? :start
            end
        end

        def after_teardown
            super
            instance_variables.map {|name| instance_variable_get name }.each do |value|
                value.stop if value.respond_to? :stop
            end
        end
    end
end