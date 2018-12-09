class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all.sort_by { |m| m.name.downcase }
    @user = current_user
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @user = current_user
    @zodiac = @subject.birthday.zodiac_sign
    if @zodiac == "Aquarius"
      @native_zodiac = "The Otter"
      @birthstone = "Amethyst"
    elsif @zodiac == "Pisces"
      @native_zodiac = "The Wolf"
      @birthstone = "Aquamarine"
    elsif @zodiac == "Aries"
      @native_zodiac = "The Falcon"
      @birthstone = "Diamond"
    elsif @zodiac == "Taurus"
      @native_zodiac = "The Beaver"
      @birthstone = "Emerald"
    elsif @zodiac == "Gemini"
      @native_zodiac = "The Dear"
      @birthstone = "Pearl"
    elsif @zodiac == "Cancer"
      @native_zodiac = "The WoodPecker"
      @birthstone = "Ruby"
    elsif @zodiac == "Leo" 
      @native_zodiac = "The Salmon"
      @birthstone = "Peridot"
    elsif @zodiac == "Virgo"
      @native_zodiac = "The Bear"
      @birthstone = "Sapphire"
    elsif @zodiac == "Libra"
      @native_zodiac = "The Raven"
      @birthstone = "Opal"
    elsif @zodiac == "Scorpio"
      @native_zodiac = "The Snake"
      @birthstone = "Topaz"
    elsif @zodiac == "Sagittarius"
      @native_zodiac = "The Owl"
      @birthstone = "Turquoise"
    elsif @zodiac == "Capricorn"
      @native_zodiac = "The Goose"
      @birthstone = "Garnet"
    end
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    @user = current_user
    @subject.user = @user

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :birthday)
    end

end
