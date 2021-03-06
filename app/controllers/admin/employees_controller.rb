class Admin::EmployeesController < AdminController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /admin/employees
  # GET /admin/employees.json
  def index
    @employees = Employee.where(parent_id: current_user.id)
  end

  # GET /admin/employees/1
  # GET /admin/employees/1.json
  def show
  end

  # GET /admin/employees/new
  def new
    @user = Employee.new
    @user.addresses.build
    @user.build_employee_detail
  end

  # GET /admin/employees/1/edit
  def edit
  end

  # POST /admin/employees
  # POST /admin/employees.json
  def create
    @user = Employee.new(employee_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_employees_path, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/employees/1
  # PATCH/PUT /admin/employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/employees/1
  # DELETE /admin/employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit!
  end
end
