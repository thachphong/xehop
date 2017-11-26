<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;

class Mdrivetrain extends DBModel
{
    public $m_body_type_id;
    public $m_body_type_name;
  
    public function initialize()
    {
        $this->setSource("m_drivetrain");
    }
    public function get_all(){
        return Mdrivetrain::find();
    }
}
