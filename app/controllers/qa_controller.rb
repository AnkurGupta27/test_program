class QaController < ApplicationController

  def index

    @projects=Project.where(status: "waiting_for_qc")

    respond_to do |format|
      format.html
    end
  end


end
