<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;

class Mfueltype extends DBModel
{
    public $m_body_type_id;
    public $m_body_type_name;
  
    public function initialize()
    {
        $this->setSource("m_fueltype");
    }
    public function get_all(){
        return Mfueltype::find();
    }
}
