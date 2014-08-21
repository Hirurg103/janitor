class TurnsController < ApplicationController
  def index
    @turns = current_user.turns.includes(duties: :obliged)
  end
end
