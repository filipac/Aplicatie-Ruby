class Drept < ActiveRecord::Base
	belongs_to :user

	private

  def drept_params
    params.require(:drept).permit(:numeDrept, :user_id, :action)
  end
end
