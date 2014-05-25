class CustomersController < InheritedResources::Base
before_action :set_customer, only:[:show, :edit, :upgrade, :destroy]
	def index
      @customers = Customer.all
	end
	def new
           @customer = Customer.new
	end
      def show
      	
      end
      def edit

      end
	def create
       @customer = Customer.new(customer_params)

       respond_to do|f|
       	if@customer.save
       		f.html{redirect_to @customer, notice: 'Successfully Created!!.'}
       		f.json{render :show, status: :created, location: @customer }
       else
       	f.html{render :new}
       		f.json{render json: @customer.errors,status: :unprocessable_entity}
       	end
       end
          
end

def update
   respond_to do |f|
   	if @customer.update(customer_params)
   		f.html{ redirect_to @customer, notice: 'Updated successfully'}
   		f.json{ render :show, status: :ok, location: @customer}
   	else
   		f.html{render :edit}
   		f.json{render json: @customer.errors, status: :unprocessable_entity}
   	end
  end
end

private
def set_customer
@customer =Customer.find(params[:id])
end
  def customer_params
       	params.require(:customer).permit(:first_name, :last_name, :email, :password, :contact)
end
end