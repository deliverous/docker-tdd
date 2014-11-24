require 'json'

module DockerTdd
    module ContainerPlugin
        def before_setup
            super
            containers if respond_to? :containers
            select_value(:start).each do |value|
                value.start
            end
            sleep select_value(:boottime).map {|value| value.boottime }.max
            select_value(:running?).each do |value|
                puts JSON.pretty_generate(value.json)
                raise RuntimeError.new "#{value.name} failed to start" unless value.running?
            end
        end

        def after_teardown
            super
            select_value(:stop).each do |value|
                value.stop
            end
        end

        def select_value signal
            instance_variables.map {|name| instance_variable_get name }.select {|value| value.respond_to? signal }
        end
    end
end