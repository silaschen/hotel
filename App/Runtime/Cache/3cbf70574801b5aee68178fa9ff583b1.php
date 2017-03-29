<?php if (!defined('THINK_PATH')) exit();?><table class="table table-bordered">
		<tbody>
			<tr>
				<td>酒店名称</td>
				<td><?php echo ($info["title"]); ?></td>
				<td>结算折扣</td>
				<td><?php echo ($info["js"]); ?>%</td>
			</tr>
			<tr>
				<td>wifi</td>
				<td><?php if($info["wifi"] == '1'): ?>支持<?php else: ?>不支持<?php endif; ?></td>
				<td>停车场</td>
				<td><?php if($info["park"] == '1'): ?>支持<?php else: ?>不支持<?php endif; ?></td>
			</tr>
			<tr>
				<td>餐厅</td>
				<td><?php if($info["restaurant"] == '1'): ?>有<?php else: ?>没有<?php endif; ?></td>
				<td>会议室</td>
				<td><?php if($info["meeting"] == '1'): ?>支持<?php else: ?>不支持<?php endif; ?></td>
			</tr>

			<tr>
				
				<td>地址</td>
				<td colspan="3"><?php echo ($info["adr"]); ?></td>
			</tr>






		</tbody>
</table>