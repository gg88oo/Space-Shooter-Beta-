MachineStates = Class{}

function MachineStates:init()
    self.states = {}
    self.current_state_index = 1
end

function MachineStates:add_state(state)
    table.insert(self.states, state)
end

function MachineStates:change_state(state_index_to_change_to)
    self.current_state_index = state_index_to_change_to
end

function MachineStates:keyreleased(key)
    self.states[self.current_state_index]:keyreleased(key)
end

function MachineStates:update(dt)
    self.states[self.current_state_index]:update(dt)
end

function MachineStates:render()
    -- draw the current state by index
    self.states[self.current_state_index]:render()
end


