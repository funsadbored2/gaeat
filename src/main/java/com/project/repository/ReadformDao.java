package com.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.DatVo;
import com.project.vo.LikeVo;
import com.project.vo.ModifyContentVo;
import com.project.vo.ModifyIngreVo;
import com.project.vo.ModifyVo;
import com.project.vo.ReadformVo;
import com.project.vo.ScrapVo;
import com.project.vo.UserpageVo;

@Repository
public class ReadformDao {
   
   @Autowired
   private SqlSession sqlSession;
   
   
   //readform 당시 할것
   public List<ReadformVo> getlist(ReadformVo readformVo){
      
      
       List<ReadformVo> list = sqlSession.selectList("readform.list",readformVo);
      
      return list;
   }
   
   public List<DatVo> getdatlist(DatVo datVo) {
      
      
      return sqlSession.selectList("readform.getByteNo",datVo);
   }
   
    public ReadformVo getread(ReadformVo readformVo2) {
       
       System.out.println(readformVo2.getRecipe_no() + "//////////////////////////////////////////////");
       
       readformVo2 = sqlSession.selectOne("readform.readformVo2",readformVo2.getRecipe_no());
      
       ReadformVo vo = sqlSession.selectOne("readform.getRecipeChefInfo", readformVo2.getChef_no());
       
       readformVo2.setNickname(vo.getNickname());
       readformVo2.setProfile(vo.getProfile());
       
       return readformVo2;
   }
   
    public List<ReadformVo> getmaterial(ReadformVo readformVo3) {
      
      
      return sqlSession.selectList("readform.list3",readformVo3);
   }
    //delete 레시피 
    
    public int deleteContent(int no) {
       return sqlSession.delete("readform.deleteContent",no);
    }
    
    public int deleteUsercomment(int no) {
       return sqlSession.delete("readform.deleteUsercomment",no);
       
    }
    public int deleteMh(int no) {
       return sqlSession.delete("readform.deleteMh",no);
    }
    public int deletesr(int no) {
       return sqlSession.delete("readform.deletesr",no);
    }
    public int selectTagCount(int no) {
       
              
       return sqlSession.selectOne("readform.countTag",no);
    }
    public int deleteTagBoth(int no) {
       
       int tag_no=sqlSession.selectOne("readform.findTagNo",no);
       sqlSession.delete("readform.deleteTh",no);
              
       return sqlSession.delete("readform.deleteTag",tag_no);
    }
    
    public int deleteTagHs(int no) {
       
       
       return sqlSession.delete("readform.deleteTh",no);
    }
    public int deleteRecipe(int no) {
       return sqlSession.delete("readform.deleteRecipe",no);
    }
    
    //레시피 수정창
  //레시피 수정창
    public ModifyVo modifyData(int no) {
       
    	ModifyVo vo = sqlSession.selectOne("readform.modifyData",no);
    	
    	vo.setRecipebook_name(sqlSession.selectOne("readform.getRecipebookName",vo.getRecipebook_no()));
   
       return vo;
    }
    
    public List<ModifyIngreVo> modifyIngre(int no){
    	
    	List<ModifyIngreVo> ingreList = sqlSession.selectList("readform.modifyIngre", no);
    	
    	for(int i =0; i < ingreList.size(); i++){
    		int material_no =  ingreList.get(i).getMaterial_no();
    		String material_name = sqlSession.selectOne("readform.getMaterialName", material_no);
    		ingreList.get(i).setMaterial_name(material_name);
    		
    		int order = i + 1;
    		String ingre_name = "ingre_" + order;
    		String amount_name = "amount_" + order;
    		String div_name = "ingreDiv_" + order;
    		ingreList.get(i).setIngre_name(ingre_name);
    		ingreList.get(i).setAmount_name(amount_name);
    		ingreList.get(i).setDiv_name(div_name);
    	}
    	
    	
    	return ingreList;
    }
    
    public List<ModifyContentVo> modifyContent(int no) {

	    
	    
       List<ModifyContentVo> modifyVoList = sqlSession.selectList("readform.modifyContent", no);
 	   
 	  return modifyVoList;
    }
    
    //왼쪽 항목
    public UserpageVo getUser(int chef_no) {
      UserpageVo userpageVo = sqlSession.selectOne("readform.selectUserByNo", chef_no);
      return userpageVo;
   }
   
   public List<UserpageVo> getRecipebookList(int chef_no) {
      return sqlSession.selectList("readform.getRecipebookList", chef_no);
   }
   
   //readform 하면 나오는 값
   
   
   
   public int insertVo(DatVo datVo) {
      
      return sqlSession.insert("readform.insertNo",datVo);
   }
   
   public List<DatVo> selectByNo(DatVo datVo) {
      return sqlSession.selectList("readform.selectByno",datVo);
      
   }
   public ReadformVo scrapcheck(ReadformVo checvo) {
	      return sqlSession.selectOne("readform.scrapcheck",checvo);
	      
	   }
   //likecheck
   public String likecheck(LikeVo likcecheck) {
	   System.out.println("likecheck3");
	  String a= sqlSession.selectOne("readform.likecheck",likcecheck);
	   System.out.println("likecheck4"+a);
	      return a;
	      
	   }
   
   //delete
   public int delete(DatVo datVo) {
      
      return sqlSession.delete("readform.delete",datVo);
      
   }
   
   public int addScrap(ScrapVo vo) {
      
      return sqlSession.insert("readform.addScrap", vo);
   }

   

   
   public int removeScrap(ScrapVo vo) {
	   return  sqlSession.delete("readform.removeScrap", vo);
	    
	   }
   
   
   public int addlike(LikeVo vo) {
	   return  sqlSession.insert("readform.addlike", vo);
	    
	   }
   public int dellike(LikeVo vo) {
	   return  sqlSession.delete("readform.dellike", vo);
	    
	   }
	
	
	//////////////////////////////////////////////////////////////////////////
	//모바일//모바일//모바일//모바일//모바일//모바일//모바일//모바일//모바일//모바일//모바일//모바일//
	//////////////////////////////////////////////////////////////////////////
	public SocialUserVo mobilelogin(SocialUserVo user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.selectUser1", user);
	}

}
