module Api
  module V1
      class UfsController < V1Controller
          def by_date
              @uf = Uf.find_by(date: params[:date])
              if @uf == nil
                render json: 'Date does not exist'
              else
                client = request.headers['X-Client']
                status = Charge.charge_client(client)
                if status == 404
                  render json: "Client not found"
                else
                  render json: @uf
                end
              end
          end

          def client
            @charge = Charge.find_by(client: params[:client])
            render json: @charge
          end
      end
  end
end

# class UfsController < ApplicationController
#   before_action :set_uf, only: [:show, :update, :destroy]

#   # GET /ufs
#   def index
#     @ufs = Uf.all

#     render json: @ufs
#   end

#   # GET /ufs/1
#   def show
#     render json: @uf
#   end

#   # POST /ufs
#   def create
#     @uf = Uf.new(uf_params)

#     if @uf.save
#       render json: @uf, status: :created, location: @uf
#     else
#       render json: @uf.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /ufs/1
#   def update
#     if @uf.update(uf_params)
#       render json: @uf
#     else
#       render json: @uf.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /ufs/1
#   def destroy
#     @uf.destroy
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_uf
#       @uf = Uf.find(params[:id])
#     end

#     # Only allow a trusted parameter "white list" through.
#     def uf_params
#       params.require(:uf).permit(:value, :date)
#     end
# end
