package net.developia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.domain.Criteria;
import net.developia.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);		// 댓글 등록
	public ReplyVO read(Long rno);		// 댓글 하나 가져오기
	public int delete(Long rno);		// 댓글 삭제
	public int update(ReplyVO reply);	// 댓글 수정
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);	// 게시글의 댓글
	
}
