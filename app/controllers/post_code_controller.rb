class PostCodeController < ApplicationController
  def lookup 
    post_code = PostCode.first(:conditions => ['post_code = ?', params[:post_code]])
    municipality = Municipality.first(:conditions => ['id = ?', post_code.municipality_id])
    county = County.first(:conditions => ['id = ?', municipality.county_id])

    respond_to do |format|
      format.json { render :json => { 'post_code' => { 'municipality' => municipality.id, 'county' => county.id } } }
    end
  end
end
